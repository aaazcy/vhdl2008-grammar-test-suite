-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_declaration ::= subprogram_specification ;
-- Case Type: Positive
-- Test Focus: Minimal form: procedure declaration without parameters - procedure p_reset; with only procedure designator and semicolon, verification of minimal usable form of subprogram_declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_sd_min is
  procedure p_inc(signal v:inout integer);
end package pkg_sd_min;
package body pkg_sd_min is
  procedure p_inc(signal v:inout integer) is begin v<=v+1; end procedure;
end package body pkg_sd_min;
entity sd_min_ent is port(clk:in bit; ctr:out integer); end entity;
architecture bh of sd_min_ent is
  signal s_cnt:integer:=0;
begin
  process(clk) begin
    if clk'event and clk='1' then work.pkg_sd_min.p_inc(s_cnt); end if;
  end process;
  ctr<=s_cnt;
end architecture bh;
