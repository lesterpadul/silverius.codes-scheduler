import React from "react";
import { Route, Switch } from "react-router-dom";
import Inbox from "./Inbox";

const App = () => {
    return (
        <Switch>
            <Route exact path="/message_view/inbox" component={Inbox} />
        </Switch>
    )
}
export default App;