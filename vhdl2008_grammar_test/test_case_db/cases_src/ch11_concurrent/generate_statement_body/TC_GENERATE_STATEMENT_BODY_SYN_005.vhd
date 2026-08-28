-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_BODY_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_STATEMENT_BODY
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_statement_body ::= [ block_declarative_part begin ] { concurrent_statement } [ end [ alternative_label ] ; ]
-- Case Type: Positive
-- Test Focus: generate body in a for generate containing multiple concurrent assignments and a process——verifies that generate_statement_body supports mixing multiple kinds of concurrent statements in the for_generate_statement context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gen_body_for_ent is
  port(clk : in bit; din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity gen_body_for_ent;
architecture bh of gen_body_for_ent is
  type t_byte_arr is array(0 to 7) of bit_vector(7 downto 0);
  signal s_stages : t_byte_arr;
begin
  gen_sr : for i in 0 to 6 generate
    signal s_local : bit_vector(7 downto 0);
  begin
    s_local <= s_stages(i);
    proc_reg : process(clk) is
    begin
      if clk'event and clk = '1' then
        s_stages(i+1) <= s_local;
      end if;
    end process proc_reg;
  end generate gen_sr;
  s_stages(0) <= din;
  dout <= s_stages(7);
end architecture bh;
