# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils readme.gentoo-r1

DESCRIPTION="Intelligent Python IDE with unique code assistance and analysis"
HOMEPAGE="http://www.jetbrains.com/pycharm/"
SRC_URI="http://download.jetbrains.com/python/${P}.tar.gz"

LICENSE="PyCharm_Academic PyCharm_Classroom PyCharm PyCharm_OpenSource PyCharm_Preview"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=virtual/jre-1.8
	 dev-python/pip"
DEPEND=""

RESTRICT="mirror strip"
QA_PREBUILT="*"

MY_PN=${PN/-professional/}
S="${WORKDIR}/${MY_PN}-${PV}"

src_install() {
	insinto /opt/${PN}
	doins -r *

	fperms a+x /opt/${PN}/bin/{pycharm.sh,fsnotifier{,64},inspect.sh}

	dosym /opt/${PN}/bin/pycharm.sh /usr/bin/${PN}
	newicon "bin/${MY_PN}.png" ${PN}.png
	make_desktop_entry ${PN} "${PN}" "${PN}"

	readme.gentoo_create_doc
}
