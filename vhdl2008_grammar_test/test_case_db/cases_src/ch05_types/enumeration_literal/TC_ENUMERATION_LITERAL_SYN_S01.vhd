-- =============================================================
-- Case ID: TC_ENUMERATION_LITERAL_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ENUMERATION_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Test Focus: Enumeration literal: identifier ｜ character_literal
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_enumeration_literal_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_enumeration_literal_syn_s01 is
  type t_el is (RED,GREEN,BLUE,'0','1'); type t_elc is ('X','Y','Z');
  signal s_el:t_el:=RED; signal s_elc:t_elc:='X';
begin
  process(s_el)
  begin
    case s_el is when RED=>r<=1; when GREEN=>r<=2; when others=>r<=0; end case;
  end process;end architecture bh;
