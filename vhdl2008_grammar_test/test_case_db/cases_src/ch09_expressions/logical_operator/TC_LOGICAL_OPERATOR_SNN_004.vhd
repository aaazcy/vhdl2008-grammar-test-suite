-- =============================================================
-- Case ID: TC_LOGICAL_OPERATOR_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_operator ::= and | or | nand | nor | xor | xnor
-- Case Type: Negative
-- Test Focus: SNN: misspelled logical_operator — using "nad" instead of "nand", verifying that logical_operator must be one of the 6 reserved words listed in the BNF (and/or/nand/nor/xor/xnor), a misspelling is parsed as an identifier rather than an operator causing a syntax error
-- Expected Result: Triggers syntax error: "nad" is not a recognized logical_operator
-- Dependencies: None
-- =============================================================
entity ent_bad_keyword is
  port (
    a_i : in  bit;
    b_i : in  bit;
    y_o : out bit
  );
end entity ent_bad_keyword;

architecture rtl of ent_bad_keyword is
begin
  -- ERROR: "nad" is not a valid logical_operator keyword (should be "nand")
  y_o <= a_i nad b_i;
end architecture rtl;
