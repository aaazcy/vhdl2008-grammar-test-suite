-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declaration ::= subprogram_specification ;
-- Case Type: Positive
-- Test Focus: subprogram_declaration: procedure specification with signal parameters — exercises the BNF with a procedure_specification using signal-class parameters; the subprogram_declaration ends with the mandatory ';'
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subprog_decl_proc is
  port (
    n_rst   : in  bit;
    clk     : in  bit;
    data_in : in  bit_vector(3 downto 0);
    data_out: out bit_vector(3 downto 0)
  );
end entity;

architecture test of subprog_decl_proc is
  -- subprogram_declaration: procedure_specification ;
  procedure p_pipeline(signal clk : in bit; signal din : in bit_vector; signal dout : out bit_vector);

  procedure p_pipeline(signal clk : in bit; signal din : in bit_vector; signal dout : out bit_vector) is
  begin
    if clk'event and clk = '1' then
      dout <= din;
    end if;
  end procedure;

  signal s_out : bit_vector(3 downto 0);
begin
  process(clk, n_rst) is
  begin
    if n_rst = '0' then
      s_out <= (others => '0');
    else
      p_pipeline(clk, data_in, s_out);
    end if;
  end process;
  data_out <= s_out;
end architecture test;
