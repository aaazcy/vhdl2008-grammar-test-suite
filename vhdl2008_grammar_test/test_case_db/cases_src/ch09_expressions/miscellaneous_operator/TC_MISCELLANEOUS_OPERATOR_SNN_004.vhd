-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_MISCELLANEOUS_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: miscellaneous_operator ::= ** | abs | not
-- Case Type: Negative
-- Test Focus: SNN: misspelled miscellaneous_operator — using "neg" instead of "not" for logical negation, verifying that miscellaneous_operator must be one of the 3 keywords/symbols listed in the BNF (** abs not), "neg" is not a legal VHDL operator
-- Expected Result: Triggers syntax error: "neg" is not a recognized miscellaneous_operator
-- Dependencies: None
-- =============================================================
entity ent_bad_keyword is
  port (
    a_i : in  bit;
    y_o : out bit
  );
end entity ent_bad_keyword;

architecture rtl of ent_bad_keyword is
begin
  -- ERROR: "neg" is not a valid miscellaneous_operator (use "not")
  y_o <= neg a_i;
end architecture rtl;
