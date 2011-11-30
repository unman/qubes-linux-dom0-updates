stage1:
	rpmbuild --rebuild --define "_rpmdir rpm/" libdrm-*.src.rpm 
	rpmbuild --rebuild --define "_rpmdir rpm/" xorg-x11-util-macros-*.src.rpm
	rpmbuild --rebuild --define "_rpmdir rpm/" llvm-*.src.rpm
	rpmbuild --rebuild --define "_rpmdir rpm/" kmodtool-*.src.rpm

stage2:
	rpmbuild --rebuild --define "_rpmdir rpm/" xorg-x11-drv-intel-*.src.rpm 
	rpmbuild --rebuild --define "_rpmdir rpm/" mesa-*.src.rpm 

nvidia:
	$(MAKE) -C nvidia-prioprietary-drivers rpms

update-repo-installer:
	ln -f rpm/noarch/*.rpm ../installer/yum/dom0-updates/rpm/
	ln -f rpm/x86_64/*.rpm ../installer/yum/dom0-updates/rpm/

clean:

