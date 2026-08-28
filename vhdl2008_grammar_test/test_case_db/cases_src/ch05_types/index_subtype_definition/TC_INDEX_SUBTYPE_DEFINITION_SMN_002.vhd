-- =============================================================
-- Case ID: TC_INDEX_SUBTYPE_DEFINITION_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_INDEX_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_subtype_definition ::= type_mark range <>
-- Case Type: Negative
-- Test Focus: Static model negative — index subtype definition uses
--            a non-discrete type_mark (real) where the VHDL standard
--            requires a discrete type for array index. A real type
--            cannot be used with range <> in an array index context.
-- Expected Result: Triggers non-discrete index type error
-- Dependencies: None
-- =============================================================
entity index_subtype_non_discrete_err is
  port (
    dout : out integer
  );
end entity index_subtype_non_discrete_err;

architecture rtl of index_subtype_non_discrete_err is
  type t_bad_array is array (real range <>) of integer;  -- ERROR: real not discrete for index
  signal s : t_bad_array(0.0 to 1.0);
begin
  dout <= 0;
end architecture rtl;
