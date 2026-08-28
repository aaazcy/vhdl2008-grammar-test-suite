-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2.1
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Positive
-- Test Focus: character literal enumeration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enum_spc2_ent is port(r:out integer); end entity;
architecture bh of enum_spc2_ent is
  type t_sul is ('U', 'X', '0', '1', 'Z', 'W', 'L', 'H', '-');
  type t_hex is ('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F');
  signal s_sul : t_sul := '0';
  signal s_hex : t_hex := 'A';
begin
  process
    variable v : integer := 0;
  begin
    v := t_sul'pos(s_sul);
    v := t_hex'pos(s_hex);
    r <= v; wait;
  end process;
end architecture bh;
