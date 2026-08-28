-- =============================================================
-- Case ID: TC_GRAPHIC_CHARACTER_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: graphic_character ::= basic_graphic_character | lower_case_letter | other_special_character
-- Case Type: Negative
-- Test Focus: Unescaped double quote " in a string literal — " is the string delimiter, it must be escaped (two double quotes) when appearing in string content
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity gc_sem_001 is
  port (
    msg_out : out string(1 to 5)
  );
end entity gc_sem_001;

architecture rtl of gc_sem_001 is
  constant C_BAD : string(1 to 5) := "HE"LLO";
begin
  msg_out <= C_BAD;
end architecture rtl;
