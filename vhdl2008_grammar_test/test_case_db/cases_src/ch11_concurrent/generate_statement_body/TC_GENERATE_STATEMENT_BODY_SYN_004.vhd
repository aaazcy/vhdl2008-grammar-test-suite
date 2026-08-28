-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_BODY_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_STATEMENT_BODY
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_statement_body ::= [ block_declarative_part begin ] { concurrent_statement } [ end [ alternative_label ] ; ]
-- Case Type: Positive
-- Test Focus: generate body containing a complete block_declarative_part + begin + concurrent statements——after declaring local signals and constants, begin separates the declaration and statement regions, verifying that generate_statement_body supports the complete two-part declaration+statement structure
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gen_body_decl_ent is
  port(clk : in bit; din : in bit_vector(3 downto 0); dout : out bit_vector(3 downto 0));
end entity gen_body_decl_ent;
architecture bh of gen_body_decl_ent is
  constant pipe_stage : integer := 1;
begin
  gen_pipe : case pipe_stage generate
    when 0 =>
      dout <= din;
    when 1 =>
      constant C_DELAY : time := 1 ns;
      signal s_reg : bit_vector(3 downto 0);
    begin
      proc_dly : process(clk) is
      begin
        if clk'event and clk = '1' then
          s_reg <= din after C_DELAY;
          dout  <= s_reg;
        end if;
      end process proc_dly;
    end;
    when others =>
      dout <= din;
  end generate gen_pipe;
end architecture bh;
