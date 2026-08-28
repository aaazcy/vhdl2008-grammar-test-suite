-- =============================================================
-- Case ID: TC_CONCURRENT_PROCEDURE_CALL_STATEMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.4
-- Production: concurrent_procedure_call_statement ::= [ label : ] [ postponed ] procedure_call ;
-- Case Type: Positive
-- Test Focus: multiple concurrent procedure calls coexist — init_regs and propagate are two different procedures used as independent concurrent statements, verifying that an architecture may contain multiple concurrent procedure calls
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cpc_multi_ent is
  port(clk, rst_n : in bit; din : in bit_vector(3 downto 0); dout : out bit_vector(3 downto 0));
end entity cpc_multi_ent;
architecture bh of cpc_multi_ent is
  signal s_reg : bit_vector(3 downto 0) := "0000";
  procedure init_regs(signal rst : in bit; signal reg : out bit_vector(3 downto 0)) is
  begin
    if rst = '0' then
      reg <= "0000";
    end if;
  end procedure init_regs;
  procedure propagate(signal clk_sig : in bit; signal src : in bit_vector; signal dst : out bit_vector) is
  begin
    if clk_sig'event and clk_sig = '1' then
      dst <= src;
    end if;
  end procedure propagate;
begin
  init : init_regs(rst_n, s_reg);
  prop : propagate(clk, din, s_reg);
  dout <= s_reg;
end architecture bh;
