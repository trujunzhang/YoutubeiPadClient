//
// Created by djzhang on 12/12/14.
// Copyright (c) 2014 djzhang. All rights reserved.
//

#import "MDYTDetailVideoInfo.h"


@implementation MDYTDetailVideoInfo {

}


- (instancetype)init {
   self = [super init];
   if (self) {
      // line001
      self.snippet.channelTitle = @"Jean-Marc Denis";

      // line002
      self.snippet.descriptionString =
       @"Thus tutorial shows you how to set up repeat reminders using a combination of OmniFocus, "
       "Keyboard Maestro and Due App. \n"
       "Note that there’s been a slight alteration to the macro as the date wasn’t parsing properly. \n"
       "This has now been fixed in the download.\n\nThe link to the Keyboard Maestro Macro is below.\n"
       "\n\nhttp://bit.ly/DLOF2KBMM\n\n("
       "You will need to remove the .txt from the end of the filename so that KBM will recognise it as a macro"
       ")\n\nHelp us caption & translate this video!\n\nhttp://amara.org/v/F06M/"
       "According to a living-e rep they are considering adding an option to store the password in the keychain:\n"
       "http://forum.webedition.de/phpBB/viewtopic.php?f=4&t=5517&p=12019\n"
       "Update: I pestered Living-e support and got them to add it as a feature request to their bug tracker. \n"
       "The link is here: http://qa.living-e.de/tracker/view.php?id=3648 (requires registration) \n"
       "if you want to follow it.\n"
       "Another update: Still following this issue.\n "
       "Looks like living-e moved their bug tracker, the new link to this issue is:\n"
       "http://bugs.mamp.info/view.php?id=3652\n"
       "It's in German but the Google translation";
   }

   return self;
}


@end