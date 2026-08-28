-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Positive
-- Test Focus: Enum type mixing identifier+character literal: 3 enum types - pure identifier(RED,GREEN,BLUE) / pure character literal('0','1','X','Z') / mixed identifier+char(OK,'E',WARN), verifying the two forms of enumeration_literal can coexist in one type definition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enum_ent is port(sel:in integer range 0 to 2; y:out integer); end entity;
architecture bh of enum_ent is
  type t_color is (RED, GREEN, BLUE);
  type t_tri  is ('0', '1', 'X', 'Z');
  type t_status is (OK, 'E', WARN);
  signal s_c:t_color:=RED;
  signal s_t:t_tri:='X';
  signal s_s:t_status:=OK;
begin
  process(sel) begin
    case sel is
      when 0 => s_c<=GREEN; y<=1;
      when 1 => s_t<='1';  y<=2;
      when 2 => s_s<=WARN;  y<=3;
    end case;
  end process;
end architecture bh;
