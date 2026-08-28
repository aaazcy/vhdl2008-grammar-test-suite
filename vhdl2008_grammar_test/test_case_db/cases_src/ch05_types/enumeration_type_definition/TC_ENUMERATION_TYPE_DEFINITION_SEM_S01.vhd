-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SEM_S01
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2, Section 10.9 (matching case)
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Positive
-- Test Focus: Enumeration type containing a don't-care character literal '-' correctly exercised through a VHDL-2008 matching case statement -- validates that the char literal '-' participates properly in the matching-case equivalence semantics where '-' in case choices acts as a wildcard matching any enumeration value, a semantic behavior unique to enumeration types with character literals
-- Expected Result: Compiles and elaborates successfully
-- Dependencies: None
-- =============================================================
entity enum_matchcase_ent is
  port(
    sel : in  integer range 0 to 3;
    hit : out bit
  );
end entity;

architecture rtl of enum_matchcase_ent is
  type t_tri is ('0', '1', 'Z', '-');
  signal val : t_tri;
begin
  with sel select
    val <= '0' when 0, '1' when 1, 'Z' when 2, '-' when 3;

  process(val)
  begin
    case? val is
      when '0'           => hit <= '0';
      when '1'           => hit <= '1';
      when 'Z'           => hit <= '0';
      when '-'           => hit <= '1';
      when others        => hit <= '0';
    end case?;
  end process;
end architecture rtl;
