-- =============================================================
-- Case ID: TC_INDEX_CONSTRAINT_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_INDEX_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_constraint ::= ( discrete_range { , discrete_range } )
-- Case Type: Negative
-- Test Focus: static model negative — the index_constraint 't_vec(0 to 3, 0 to 1)' provides two discrete ranges although the array type t_vec has only one index, so the subtype has more indexes than the array type
-- Expected Result: Triggers semantic error: subtype has more indexes than array type "t_vec"
-- Dependencies: None
-- =============================================================
entity ic_ent is end entity;
architecture rtl of ic_ent is
  type t_vec is array(integer range <>) of integer;
  subtype t_bad is t_vec(0 to 3, 0 to 1);
begin
end architecture;
