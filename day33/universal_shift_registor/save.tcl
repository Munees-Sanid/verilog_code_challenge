proc addAllSignals {scope} {
    foreach sig [gtkwave::getSignals $scope] {
        gtkwave::addWave $sig
    }
    foreach subscope [gtkwave::getScopes $scope] {
        addAllSignals $subscope
    }
}

addAllSignals ""

