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
      self.snippet.descriptionString = @"Thus tutorial shows you how to set up repeat reminders using a combination of OmniFocus, "
       "Keyboard Maestro and Due App. "
       "Note that there’s been a slight alteration to the macro as the date wasn’t parsing properly. "
       "This has now been fixed in the download.\\n\\nThe link to the Keyboard Maestro Macro is below."
       "\\n\\nhttp://bit.ly/DLOF2KBMM\\n\\n("
       "You will need to remove the .txt from the end of the filename so that KBM will recognise it as a macro"
       ")\\n\\nHelp us caption & translate this video!\\n\\nhttp://amara.org/v/F06M/";
   }

   return self;
}


@end