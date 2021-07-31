#!/bin/sh

echo ""
echo "Checking if you're running Pop, because Pop doesn't work with this script, and"
echo "will never work because Pop developers need to learn how to set their package dependencies properly."
echo ""
sudo rm -rf /tmp/check-if-pop-bad.txt

sudo apt install -y liblinux-distribution-perl

perl -e '
    use Linux::Distribution qw(distribution_name distribution_version);

    my $linux = Linux::Distribution->new;
    if(my $distro = $linux->distribution_name()) {
          my $version = $linux->distribution_version();
          print "$distro";
    } else {
          print "nevermind";
    }
' >> /tmp/check-if-pop-bad.txt
echo ""
echo "You are running:"
echo ""
cat /tmp/check-if-pop-bad.txt
echo ""
echo ""

VARFILECONTENTS="$(cat /tmp/check-if-pop-bad.txt)"

echo "Now inside of a variable which is:"
echo $VARFILECONTENTS

echo ""

echo "Checking..."

echo ""


if [ $VARFILECONTENTS = 'pop' ]; then
	echo "" && echo "You are running Pop, this script does not work on Pop." && echo "Please nuke and pave (fully format) your OS disk, and fresh install another distro. I recommend Xubuntu for this." && echo "" && exit & exit
fi

echo "Good news, you're not running Pop, so we can continue."

echo ""
