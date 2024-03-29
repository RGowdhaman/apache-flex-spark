////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////

package spark.accessibility
{

import flash.accessibility.Accessibility;
import flash.events.Event;

import mx.accessibility.AccImpl;
import mx.accessibility.AccConst;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.resources.IResourceManager;
import mx.resources.ResourceManager;

import spark.components.Spinner;

use namespace mx_internal;

[ResourceBundle("components")]

/**
 *  SpinnerAccImpl is the accessibility implementation class
 *  for spark.components.Spinner.
 *
 *  <p>When a Spark Spinner is created,
 *  its <code>accessibilityImplementation</code> property
 *  is set to an instance of this class.
 *  The Flash Player then uses this class to allow MSAA clients
 *  such as screen readers to see and manipulate the Spinner.
 *  See the mx.accessibility.AccImpl and
 *  flash.accessibility.AccessibilityImplementation classes
 *  for background information about accessibility implementation
 *  classes and MSAA.</p>
 *
 *  <p><b>Children</b></p>
 *
 *  <p>A Spinner has 2 MSAA children,
 *  which are its increment and decrement buttons.</p>
 *
 *  <p><b>Role</b></p>
 *
 *  <p>The MSAA Role of a Spinner is ROLE_SYSTEM_SPINBUTTON.</p>
 *
 *  <p>The Role of each child button is ROLE_SYSTEM_PUSHBUTTON.</p>
 *
 *  <p><b>Name</b></p>
 *
 *  <p>The MSAA Name of a Spinner is, by default, an empty string.
 *  When wrapped in a FormItem element, the Name is the FormItem's label.
 *  To override this behavior,
 *  set the Spinner's <code>accessibilityName</code> property.</p>
 *
 *  <p>The Name of each child button comes from a locale-dependent resource.
 *  For the en_US locale, the names are "More" and "Less".</p>
 *
 *  <p>When the Name of the Spinner or one of its child button changes,
 *  a Spinner dispatches the MSAA event EVENT_OBJECT_NAMECHANGE
 *  with the proper childID for the button or 0 for itself.</p>
 *
 *  <p><b>Description</b></p>
 *
 *  <p>The MSAA Description of a Spinner is, by default, an empty string,
 *  but you can set the Spinner's <code>accessibilityDescription</code>
 *  property.</p>
 *
 *  <p>The Description of each child button is the empty string.</p>
 *
 *  <p><b>State</b></p>
 *
 *  <p>The MSAA State of a Spinner is a combination of:
 *  <ul>
 *    <li>STATE_SYSTEM_UNAVAILABLE (when enabled is false)</li>
 *    <li>STATE_SYSTEM_FOCUSABLE (when enabled is true)</li>
 *    <li>STATE_SYSTEM_FOCUSED
 *    (when enabled is true and the Spinner has focus)</li>
 *  </ul></p>
 *
 *  <p>When the State of the Spinner or one of its child buttons changes,
 *  a Spinner dispatches the MSAA event EVENT_OBJECT_STATECHANGE
 *  with the proper childID for the button or 0 for itself.</p>
 *
 *  <p><b>Value</b></p>
 *
 *  <p>The MSAA Value of a Spinner is the value
 *  currently held by the Spinner.</p>
 *
 *  <p>The child buttons do not have MSAA values.</p>
 *
 *  <p>When the Value of the Spinner changes,
 *  a Spinner dispatches the MSAA event EVENT_OBJECT_VALUECHANGE.</p>
 *
 *  <p><b>Location</b></p>
 *
 *  <p>The MSAA Location of a Spinner, or one of its child buttons,
 *  is its bounding rectangle.</p>
 *
 *  <p><b>Default Action</b></p>
 *
 *  <p>A Spinner does not have an MSAA DefaultAction.</p>
 *
 *  <p>The DefaultAction of each child button is "Press".</p>
 *
 *  <p>Performing the default action of one of the child buttons
 *  will increment or decrement the value.</p>
 *
 *  <p><b>Focus</b></p>
 *
 *  <p>A Spinner accepts focus.
 *  When it does so, it dispatches the MSAA event EVENT_OBJECT_FOCUS event.</p>
 *
 *  <p><b>Selection</b></p>
 *
 *  <p>A Spinner does not support selection in the MSAA sense.</p>
 *
 *  @langversion 3.0
 *  @playerversion Flash 10
 *  @playerversion AIR 1.5
 *  @productversion Flex 4
 */
public class SpinnerAccImpl extends AccImpl
{


    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    /**
     *  Enables accessibility in the Spinner class.
     *
     *  <p>This method is called by application startup code
     *  that is autogenerated by the MXML compiler.
     *  Afterwards, when instances of Spinner are initialized,
     *  their <code>accessibilityImplementation</code> property
     *  will be set to an instance of this class.</p>
     *
     *  @langversion 3.0
     *  @playerversion Flash 10
     *  @playerversion AIR 1.5
     *  @productversion Flex 4
     */
    public static function enableAccessibility():void
    {
        Spinner.createAccessibilityImplementation = 
            createAccessibilityImplementation;
    }

    /**
     *  @private
     *  Creates a Spinner's AccessibilityImplementation object.
     *  This method is called from UIComponent's
     *  initializeAccessibility() method.
     */
    mx_internal static function createAccessibilityImplementation(
                                component:UIComponent):void
    {
        component.accessibilityImplementation =
            new SpinnerAccImpl(component);
    }

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructor.
     *
     *  @param master The UIComponent instance that this AccImpl instance
     *  is making accessible.
     *
     *  @langversion 3.0
     *  @playerversion Flash 10
     *  @playerversion AIR 1.5
     *  @productversion Flex 4
     */
    public function SpinnerAccImpl(master:UIComponent)
    {
        super(master);

        role = AccConst.ROLE_SYSTEM_SPINBUTTON;
    }

    //--------------------------------------------------------------------------
    //
    //  Overridden properties: AccImpl
    //
    //--------------------------------------------------------------------------

    //----------------------------------
    //  eventsToHandle
    //----------------------------------

    /**
     *  @private
     *    Array of events that we should listen for from the master component.
     */
    override protected function get eventsToHandle():Array
    {
        return super.eventsToHandle.concat([ Event.CHANGE ]);
    }

    //--------------------------------------------------------------------------
    //
    //  Overridden methods: AccessibilityImplementation
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     *  Gets the role for the component.
     *
     *  @param childID children of the component
     */
    override public function get_accRole(childID:uint):uint
    {
        return childID == 0 ? role : AccConst.ROLE_SYSTEM_PUSHBUTTON;
    }

    /**
     *  @private
     *  Method to return an array of childIDs. For the Spinner component the IDs
     *  for the decrement and increment buttons are returned.
     *
     *  @return Array
     */
    override public function getChildIDArray():Array
    {
        return createChildIDArray(2);
    }

    /**
     *  @private
     *  IAccessible method for returning the bounding box of the spinbutton parts.
     *
     *  @param childID uint
     *
     *  @return Location Object
     */
    override public function accLocation(childID:uint):*
    {
        switch(childID)
        {
            case 0:
            {
                return master;
                break;
            }
            case 1:
            {
                return Spinner(master).incrementButton;
                break
            }
            case 2:
            {
                return Spinner(master).decrementButton;
                break
            }
        }
    }

    /**
     *  @private
     *  IAccessible method for returning the state of the SPinner.
     *  States are predefined for all the components in MSAA.
     *  Values are assigned to each state.
     *
     *  @param childID uint
     *
     *  @return State uint
     */
    override public function get_accState(childID:uint):uint
    {
        var accState:uint;
        switch(childID)
        {
            case 0: 
                accState = getState(childID);
                break;
            case 1:
            {
                if (!Spinner(master).enabled)
                    accState = AccConst.STATE_SYSTEM_UNAVAILABLE;
                break;
            }  
            case 2:
            {
                if (!Spinner(master).enabled)
                    accState = AccConst.STATE_SYSTEM_UNAVAILABLE;
                break;
            }
        }
        return accState;
    }

    /**
     *  @private
     *  IAccessible method for returning the numeric value of the Spinner
     *
     *  @param childID uint
     *
     *  @return Value String
     */
    override public function get_accValue(childID:uint):String
    {
        if (childID > 0)
            return null;
        return Spinner(master).value.toString();
    }

    /**
     *  @private
     *  IAccessible method for returning the default action
     *  of the Spinner and it's children.
     *
     *  @param childID uint
     *
     *  @return DefaultAction String
     */
    override public function get_accDefaultAction(childID:uint):String
    {
        return childID == 0 ? "" : "Press";
    }
    
    /**
     *  @private
     *  IAccessible method for performing the default action
     *  associated with The Spinner's buttons.
     *
     *  @param childID uint
     */
    override public function accDoDefaultAction(childID:uint):void
    {
        var prevValue:Number = Spinner(master).value;
        
        switch(childID)
        {
            case 1:
            {
                if (Spinner(master).enabled)
                    Spinner(master).changeValueByStep(true);
                break;
            }
				
            case 2:
            {
                if (Spinner(master).enabled)
                    Spinner(master).changeValueByStep(false);
                break;
            }
        }
        
        if (Spinner(master).value != prevValue)
		{
            master.dispatchEvent(new Event(Event.CHANGE));
            master.dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
        }
    }

    //--------------------------------------------------------------------------
    //
    //  Overridden event handlers: AccImpl
    //
    //--------------------------------------------------------------------------

    /**
	 *  @private
     *  Returns the name of the accessible component.
     *  All subclasses must implement this
     *  instead of implementing get_accName().
     *
     *  @langversion 3.0
     *  @playerversion Flash 10
     *  @playerversion AIR 1.5
     *  @productversion Flex 4
     */
    override protected function getName(childID:uint):String
    {
        var resourceManager:IResourceManager = ResourceManager.getInstance();
        if (childID == 1)
            return resourceManager.getString("components","spinnerMoreAccName");
        if (childID == 2)
            return resourceManager.getString("components","spinnerLessAccName");
        else
            return "";
    }

    /**
     *  @private
     *  Override the generic event handler.
     *  All AccImpl must implement this
     *  to listen for events from its master component.
     */
    override protected function eventHandler(event:Event):void
    {
        // Let AccImpl class handle the events
        // that all accessible UIComponents understand.
        $eventHandler(event);

        switch (event.type)
        {
            case Event.CHANGE:
            {
                Accessibility.sendEvent(master, 0,
                                        AccConst.EVENT_OBJECT_VALUECHANGE, true);
                Accessibility.sendEvent(master, 0,
                                        AccConst.EVENT_OBJECT_STATECHANGE, true);
                break;
            }
        }
    }
}

}
