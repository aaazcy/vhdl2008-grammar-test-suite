-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SYN_S07
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Positive
-- Test Focus: Mixed identifier and character-literal enumeration type exercising T'POS, T'VAL, T'SUCC, T'PRED, T'LEFTOF, T'RIGHTOF, T'IMAGE, and T'VALUE attributes -- demonstrates that the enumeration_type_definition produces a valid discrete type whose full set of predefined attributes operate correctly on the declared literals
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enum_attr_ent is
  port(
    sel  : in  integer range 0 to 5;
    val  : out integer
  );
end entity;

architecture rtl of enum_attr_ent is
  type t_severity is (NOTE, WARNING, 'E', 'F', DEBUG);
  signal s_cur : t_severity := NOTE;
begin
  process(sel, s_cur)
    variable v_int  : integer := 0;
    variable v_sev  : t_severity := NOTE;
  begin
    case sel is
      when 0 => v_int := t_severity'pos(s_cur);
      when 1 => v_sev := t_severity'val(2);
      when 2 => v_sev := t_severity'succ(s_cur);
      when 3 => v_sev := t_severity'pred(v_sev);
      when 4 => v_sev := t_severity'leftof(s_cur);
      when 5 => v_sev := t_severity'rightof(s_cur);
    end case;
    val <= v_int;
  end process;
end architecture rtl;
