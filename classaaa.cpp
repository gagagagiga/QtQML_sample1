#include "classaaa.h"
#include <QDebug>

ClassAAA::ClassAAA(QObject *parent)
    : QObject{parent}
    , _count(0)
{

}


int ClassAAA::count() const
{
    qDebug() << "count()" << _count;
    return _count;
}


void ClassAAA::setCount(const int value)
{
    qDebug() << "setCount()" << value;

    if(value != _count)
    {
        _count = value;
        emit countChanged();
    }
}

void ClassAAA::add10()
{
    _count += 10;
    qDebug() << "add10()" << _count;
    emit countChanged();
}

void ClassAAA::resetCount()
{
    _count = 0;
    qDebug() << "resetCount()" << _count;
    emit countChanged();
}


