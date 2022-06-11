#ifndef CLASSAAA_H
#define CLASSAAA_H

#include <QObject>

class ClassAAA : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int count READ count WRITE setCount NOTIFY countChanged)


public:
    explicit ClassAAA(QObject *parent = nullptr);

    int count() const;

    void setCount(const int value);

    Q_INVOKABLE void add10();

public slots:

    void resetCount();

signals:
    void countChanged();

    void countValueChanged(int value);

private:
    int _count;
};

#endif // CLASSAAA_H
