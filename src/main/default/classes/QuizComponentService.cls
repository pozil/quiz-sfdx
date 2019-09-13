public with sharing class QuizComponentService {
    @AuraEnabled(cacheable=true)
    public static List<Quiz_Question__c> getQuestionList() {
        return [SELECT Name, Answer_A__c, Answer_B__c, Answer_C__c, Answer_D__c, Correct_Answer__c, Label__c FROM Quiz_Question__c];
    }
    
    @AuraEnabled
    public static void updateQuestionSessionPhase(String updatedPhase) {
        Quiz_Session__c quizSession = [SELECT ID, Phase__c FROM Quiz_Session__c LIMIT 1];
        quizSession.Phase__c = updatedPhase;
        update quizSession;
    }     
}