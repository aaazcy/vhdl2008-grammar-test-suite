-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_MISCELLANEOUS_OPERATOR_NOT_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: miscellaneous_operator ::= ** | abs | not
-- Case Type: Negative
-- Rule Description: The not operator is predefined only for types BIT, BOOLEAN, and one-dimensional arrays of those types. It cannot be applied to integer or other non-logical types.
-- Error Category: Type mismatch
-- Test Focus: SMN: not operator used on integer type — attempting logical negation with not on an integer signal, verifying that the VHDL standard specifies not applies only to logical types (bit/boolean and their arrays), integer is not a logical type
-- Expected Result: Triggers semantic error: not requires logical type (bit/boolean/array-of-bit), not integer
-- Dependencies: None
-- =============================================================
entity ent_smn_not_int is
  port (
    a_i : in  integer;
    y_o : out integer
  );
end entity ent_smn_not_int;

architecture rtl of ent_smn_not_int is
begin
  -- ERROR: not operator requires logical type, integer is not a logical type
  y_o <= not a_i;
end architecture rtl;
