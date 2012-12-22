class EmotionController < UIViewController
  def viewDidAppear(animated)
    super(animated)

    showPicker unless @person
  end


  def showPicker
    picker = ABPeoplePickerNavigationController.alloc.init
    picker.peoplePickerDelegate = self

    self.presentModalViewController(picker, animated: true)
  end

  def peoplePickerNavigationControllerDidCancel(picker)
    self.dismissModalViewControllerAnimated(true)
  end
  
  def peoplePickerNavigationController(picker, shouldContinueAfterSelectingPerson: person)
    self.dismissModalViewControllerAnimated(true)
    @person = person
    false
  end
end
