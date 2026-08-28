-- =============================================================
-- Case ID: TC_ATTRIBUTE_NAME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_name ::= prefix ' attribute_designator [ ( expression ) ]
-- Case Type: Positive
-- Test Focus: Signal attributes: s_clk'event + s_clk'last_value — verifying the two common signal predefined attributes 'event and 'last_value when the prefix is a signal name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity an_sig_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of an_sig_ent is
  signal s_cnt:integer:=0;
begin
  process(clk) begin
    if clk'event and clk='1' then s_cnt<=s_cnt+1; end if;
  end process;
  y<=s_cnt;
end architecture bh;
