// For an introduction to the Blank template, see the following documentation:
// http://go.microsoft.com/fwlink/?LinkId=232509
(function () {
    "use strict";

    var app = WinJS.Application;
    var activation = Windows.ApplicationModel.Activation;

    app.onactivated = function (args) {
        if (args.detail.kind === activation.ActivationKind.launch) {
            if (args.detail.previousExecutionState !== activation.ApplicationExecutionState.terminated) {
                // TODO: This application has been newly launched. Initialize
                // your application here.
            } else {
                // TODO: This application has been reactivated from suspension.
                // Restore application state here.
            }
            args.setPromise(WinJS.UI.processAll());
        }
    };

    app.oncheckpoint = function (args) {
        // TODO: This application is about to be suspended. Save any state
        // that needs to persist across suspensions here. You might use the
        // WinJS.Application.sessionState object, which is automatically
        // saved and restored across suspension. If you need to complete an
        // asynchronous operation before your application is suspended, call
        // args.setPromise().
    };

    app.start();
})();

(function () {
    "use strict";

    var dataArray = [
    { title: "America the Beautiful" },
    { title: "Auld Lang Syne" },
    { title: "Blowin in the Wind" },
    { title: "Don't Think Twice, It's Alright" },
    { title: "Camptown Races" },
    { title: "Goodnight Irene" },
    { title: "Home on the Range" },
    { title: "We Shall Not Be Moved" },
    { title:  "If I Had a Hammer" },
    { title: "I've Been Working on the Railroad" },
    { title: "Jingle Bells" },
    { title: "Keep Your Eyes on the Prize" },
    { title: "Like a Rolling Stone" },
    { title: "Little Brown Jug" },
    { title: "Michael Row the Boat Ashore" },
    { title: "Love Me, I'm a Liberal" },
    { title: "My Country Tis of Thee" },
    { title: "O Christmas Tree" },
    { title: "Oh Freedom" },
    { title: "Oh Susanna" },
    { title: "Peace Train" },
    { title: "Rudolph the Red Nosed Reindeer" },
    { title: "Scarborough Fair" },
    { title: "Silent Night" },
    { title: "Star Spangled Banner" },
    { title: "Sunday Morning Coming Down" },
    { title: "Swing Low Sweet Chariot" },
    { title: "Take Me Out to the Ball Game" },
    { title: "This Land is Your Land" },
    { title: "This Little Light of Mine" },
    { title: "Up to the Mountain" },
    { title: "We Shall Overcome" },
    { title: "Yankee Doodle" }
    ];

    var itemList = new WinJS.Binding.List(dataArray);

    // Create a namespace to make the data publicly
    // accessible. 
    var publicMembers =
        {
            itemList: itemList
        };
    WinJS.Namespace.define("DataExample", publicMembers);

})();




//(function ()
//{
//    "use strict";

//    var basicList = new WinJS.Binding.FlipView(
//        [
//            { title: "Banana blast"},
//            { title: "Strawberry swirl"},
//            { title: "Magnificant mint"},
//            { title: "Lemon lift"}
//        ]);

//    WinJS.Namespace.define("ItemContainerExample",
//        {
//            flavorList: basicList

//        });
//})();