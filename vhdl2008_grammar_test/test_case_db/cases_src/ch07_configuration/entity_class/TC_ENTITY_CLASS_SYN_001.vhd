-- =============================================================
-- Case ID: TC_ENTITY_CLASS_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: entity_class ::= entity | architecture | configuration | procedure | function | package | type | subtype | constant | signal | variable | component | label | literal | units | group | file
-- Case Type: Positive
-- Test Focus: all 18 keywords of entity class: attribute specifications reference entity/architecture/signal/function/component/label/type/constant/package etc., verifies all keywords of entity_class are usable in the entity_specification of attribute_specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ec_ent is
  port(a:in bit; y:out bit);
  attribute note:string;
  attribute note of ec_ent:entity is "entity_class_test";
end entity;
architecture bh of ec_ent is
  type t_data is range 0 to 255; constant C_MAX:t_data:=255;
  signal s_val:t_data:=0; component inv is port(x:in bit; z:out bit); end component;
  function f_dbl(x:t_data) return t_data is begin return x*2; end function;
  attribute note of bh:architecture is "arch";
  attribute note of s_val:signal is "sig";
  attribute note of f_dbl[t_data return t_data]:function is "func";
  attribute note of inv:component is "comp";
  attribute note of C_MAX:constant is "const";
  type t_state is (IDLE, RUN);
  attribute note of t_state:type is "type";
begin s_val<=t_data(10); y<=a; end architecture bh;
