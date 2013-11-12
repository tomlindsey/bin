#!/bin/bash

#
# FM
# ExtractTemplateTokens
# select all output | copy
# save file

#
# BASH
# ./a file

#
# create a unique list of categories and tokens
cut -sd, -f3 $1 | tr ' ' '\n' | sort | uniq > a.tokens
cut -sd, -f2 $1 | sort | uniq > a.categories

#
# create a unique set of tokens for each category
grep -E ",Acknowledgement Email,"               $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensAcknowledgementEmail
grep -E ",Acknowledgement Email : FormRequest," $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensAcknowledgementEmail-FormRequest
grep -E ",Anonymous Grant Letter,"              $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensAnonymousGrantLetter
grep -E ",Application Received,"                $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensApplicationReceived
grep -E ",Certificate Notify,"                  $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensCertificateNotify
grep -E ",Charity Certificate,"                 $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensCharityCertificate
grep -E ",Commitment Letter,"                   $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensCommitmentLetter
grep -E ",Commitment Payment,"                  $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensCommitmentPayment
grep -E ",Commitment Receipt,"                  $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensCommitmentReceipt
grep -E ",Contact Us Email,"                    $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensContactUsEmail
grep -E ",Exception,"                           $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensException
grep -E ",Grant Approval,"                      $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensGrantApproval
grep -E ",Grant Approved,"                      $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensGrantApproved
grep -E ",Grant Certificate Approval,"          $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensGrantCertificateEmail
grep -E ",Grant Declined,"                      $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensGrantDeclined
grep -E ",Grant Letter,"                        $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensGrantLetter
grep -E ",Grant Receipt,"                       $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensGrantReceipt
grep -E ",Grant Request Approval,"              $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensGrantRequestApproval
grep -E ",Need More Information,"               $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensNeedMoreInformation
grep -E ",Payment In Process,"                  $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensPaymentInProcess
grep -E ",Payment Letter,"                      $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensPaymentLetter
grep -E ",Payment On Hold,"                     $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensPaymentOnHold
grep -E ",Report Canceled,"                     $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensReportCanceled
grep -E ",Report Due Modified,"                 $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensReportDueModified
grep -E ",Report Needs Request,"                $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensReportNeedsRequest
grep -E ",Report Question Modified,"            $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensReportQuestionModified
grep -E ",Report Received,"                     $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensReportReceived
grep -E ",Request Decline,"                     $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensRequestDecline
grep -E ",Results Report,"                      $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensResultsReport
grep -E ",Results Report Reminder,"             $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensResultsReportReminder
grep -E ",Save Draft,"                          $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensSaveDraft
grep -E ",Save Draft : FormRequest,"            $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensSaveDraft-FormRequest
grep -E ",Send Commitment Email,"               $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensSendCommitmentEmail
grep -E ",Send Email,"                          $1 | cut -sd, -f3 | tr ' ' '\n' | sort | uniq > tokensSendEmail

#
# create a set of old-style templates
if [ $2 ]
then
    for f in tokens[A-Z]*
    do
        cat $f | tr -d '{}' | awk '{printf("~%s~{%s}~\n", $1, $1);}' > $f.template
    done
fi
