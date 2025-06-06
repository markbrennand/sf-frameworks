/**
 * @description
 * Trigger to validate bindings on insert/update.
 *
 * @author Mark Brennand
 */
trigger Binding on Binding__c (after insert, after update) {
    Dependency.checkForDuplicates();
    Dependency.build((List<Binding__c>) Trigger.new);
}