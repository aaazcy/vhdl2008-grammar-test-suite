-- =============================================================
-- Case ID: TC_LETTER_OR_DIGIT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER_OR_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter_or_digit ::= letter | digit
-- Case Type: Positive
-- Test Focus: letter and digit used in extended_identifier — identifiers inside \...\ can use any letter_or_digit for non-first characters
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity lod_in_ext_id is
  port (
    \bus7_out\ : out integer
  );
end entity lod_in_ext_id;

architecture rtl of lod_in_ext_id is
  signal \reg3_val\ : integer := 77;
begin
  \reg3_val\ <= 99;
  \bus7_out\ <= \reg3_val\;
end architecture rtl;
