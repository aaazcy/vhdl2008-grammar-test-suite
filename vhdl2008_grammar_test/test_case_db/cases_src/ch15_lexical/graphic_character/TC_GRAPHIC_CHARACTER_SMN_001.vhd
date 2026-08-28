-- =============================================================
-- Case ID: TC_GRAPHIC_CHARACTER_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: graphic_character ::= basic_graphic_character | lower_case_letter | other_special_character
-- Case Type: Negative
-- Test Focus: Special character # appearing in a non-based-literal context — # is within the defined graphic character set, but illegal in an ordinary identifier or literal
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity gc_smn_001 is
  port (
    val_out : out integer
  );
end entity gc_smn_001;

architecture rtl of gc_smn_001 is
  signal s#bad : integer := 0;
begin
  s#bad <= 5;
  val_out <= s#bad;
end architecture rtl;
