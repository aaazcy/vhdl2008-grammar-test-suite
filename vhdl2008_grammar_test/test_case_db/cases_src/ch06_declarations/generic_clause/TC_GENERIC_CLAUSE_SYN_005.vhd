-- =============================================================
-- Case ID: TC_GENERIC_CLAUSE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERIC_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: generic_clause ::= generic ( generic_list ) ;
-- Case Type: Positive
-- Test Focus: Exercises generic_clause with generic that has no default value, requiring the user to provide it at instantiation.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity generic_clause_width_param is
  generic (
    DATA_WIDTH : integer;
    PIPELINE_STAGES : integer := 3
  );
  port (
    clk    : in  bit;
    d_in   : in  bit_vector(DATA_WIDTH-1 downto 0);
    d_out  : out bit_vector(DATA_WIDTH-1 downto 0)
  );
end entity generic_clause_width_param;

architecture rtl of generic_clause_width_param is
  type t_pipe is array(0 to PIPELINE_STAGES) of bit_vector(DATA_WIDTH-1 downto 0);
  signal s_pipe : t_pipe := (others => (others => '0'));
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_pipe(0) <= d_in;
      for i in 1 to PIPELINE_STAGES loop
        s_pipe(i) <= s_pipe(i-1);
      end loop;
    end if;
  end process;
  d_out <= s_pipe(PIPELINE_STAGES);
end architecture rtl;
