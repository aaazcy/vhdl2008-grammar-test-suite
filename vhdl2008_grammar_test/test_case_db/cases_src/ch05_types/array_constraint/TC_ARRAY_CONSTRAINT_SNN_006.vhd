-- =============================================================
-- Case ID: TC_ARRAY_CONSTRAINT_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_constraint ::= index_constraint [ array_element_constraint ] | ( open ) [ array_element_constraint ]
-- Case Type: Negative
-- Test Focus: SNN: stray comma after the discrete range in the index_constraint of array_constraint - 't_vec(0 to 3,)' has an extra comma before the closing parenthesis, verifying the discrete range list is comma-separated rather than comma-terminated
-- Expected Result: Triggers syntax error: extra ',' ignored
-- Dependencies: None
-- =============================================================
entity arr_con_ent is end entity;
architecture rtl of arr_con_ent is
  type t_vec is array (integer range <>) of integer;
  subtype t_bad is t_vec(0 to 3,);
begin
end architecture;
