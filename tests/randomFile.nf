a = Channel.from([1, 2, 3, 4])

    process touchThreeFiles {

    output:
    file "*.txt" into fo

    """
    touch "1.txt"
    touch "2.txt"
    touch "3.txt"
    """
}

process getFiles {
    echo true

    input:
    val n from a
    file x from fo

    """
    echo $n
    cat $x
    """
}
