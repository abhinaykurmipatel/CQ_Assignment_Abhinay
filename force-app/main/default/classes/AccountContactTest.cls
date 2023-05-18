/*
* Flow Name - Account Related Contact Flow
* Created Date - 18 May, 2023
* Author - Abhinay
* Description - Created for testing unit AccountContactTest class. 
* */

@isTest
public class AccountContactTest 
{
    @isTest
    public static void AccountInsert()
    {
        Account acc = new Account();
        	acc.Name = 'Test';
            acc.Rating = 'Hot';
            acc.Active1__c = true;
            acc.Account_Activation_Summary__c = 'Test Data';
            acc.Type = 'Customer - Channel';
            acc.Company_Email__c = 'test@gmail.com';
            acc.Phone = '989898';
        insert acc;
        List<Contact> conList2=[Select id,AccountId from Contact where AccountId=:acc.id];        
        System.assert(conList2.size()>0);   
    }
    @isTest
    public static void AccountUpdate()
    {
        Account acc = new Account();
        	acc.Name = 'Test';
            acc.Rating = 'Hot';
            acc.Type = 'Customer - Channel';
            acc.Company_Email__c = 'test@gmail.com';
            acc.Phone = '989898';
        insert acc;
        List<Contact> conList=[Select id,AccountId from Contact where AccountId=:acc.id];
        System.assert(conList.size()==0);
        	acc.Active1__c = true;
            acc.Account_Activation_Summary__c = 'Test Data';
        update acc;
        List<Contact> conList2=[Select id,AccountId from Contact where AccountId=:acc.id];
        System.assert(conList2.size()>0);            
    }

}