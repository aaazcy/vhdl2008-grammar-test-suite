-- =============================================================
-- Case ID: TC_ATTRIBUTE_NAME_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_name ::= prefix ' attribute_designator [ ( expression ) ]
-- Case Type: Positive
-- Test Focus: Type attributes: T'pos + T'val + T'leftof — verifying the type predefined attributes when the prefix is a type_mark, used for value operations on enumeration and integer types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity an_type_ent is port(y:out integer); end entity;
architecture bh of an_type_ent is
  type t_color is (RED,GREEN,BLUE);
  type t_int is range -128 to 127;
begin
  process is begin
    y<=t_color'pos(GREEN)+t_int'pos(t_int'val(10));
    wait;
  end process;
end architecture bh;
