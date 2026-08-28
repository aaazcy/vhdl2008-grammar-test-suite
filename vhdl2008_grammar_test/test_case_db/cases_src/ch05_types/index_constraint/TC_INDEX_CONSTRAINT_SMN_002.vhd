-- =============================================================
-- Case ID: TC_INDEX_CONSTRAINT_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_INDEX_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_constraint ::= ( discrete_range { , discrete_range } )
-- Case Type: Negative
-- Test Focus: static model negative — the discrete range '0 to 3.5' inside the index constraint uses a real bound although the index subtype of t_vec is integer, so the constraint cannot be applied
-- Expected Result: Triggers semantic error: can't match floating point literal with type integer
-- Dependencies: None
-- =============================================================
entity ic26b_ent is end entity;
architecture rtl of ic26b_ent is
  type t_vec is array(integer range <>) of integer;
  subtype t_bad is t_vec(0 to 3.5);
begin
end architecture;
