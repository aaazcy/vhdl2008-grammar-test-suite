-- =============================================================
-- Case ID: TC_LITERAL_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Positive
-- Test Focus: literal: physical literal (time) and based literal (octal) in varied contexts
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity literal_syn4_ent is port(clk:out bit; y:out integer); end entity;
architecture bh of literal_syn4_ent is
  signal s_cnt:integer:=0;
  signal s_val:integer:=8#377#;
begin
  clk<=not clk after 10 ns;
  process is
  begin
    wait for 100 ns;
    s_cnt<=s_cnt+1;
    y<=s_cnt+s_val;
  end process;
end architecture bh;
