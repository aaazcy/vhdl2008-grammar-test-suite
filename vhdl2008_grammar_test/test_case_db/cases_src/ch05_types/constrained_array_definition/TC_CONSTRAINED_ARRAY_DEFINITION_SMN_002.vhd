-- =============================================================
-- Case ID: TC_CONSTRAINED_ARRAY_DEFINITION_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_CONSTRAINED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: constrained_array_definition ::= array index_constraint of element_subtype_indication
-- Case Type: Negative
-- Test Focus: Static model negative — constrained array type t_lut has index constraint 0 to 15 (16 elements), but the aggregate initializer supplies 17 elements, so the value length violates the constrained array definition
-- Expected Result: Triggers semantic error: too many elements associated
-- Dependencies: None
-- =============================================================
entity cad_ent is port(dout : out integer); end entity;
architecture rtl of cad_ent is
  type t_lut is array (natural range 0 to 15) of integer;
  signal s_lut : t_lut := (0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);
begin
  dout <= s_lut(0);
end architecture;
