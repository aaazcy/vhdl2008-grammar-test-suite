-- =============================================================
-- Case ID: TC_FORMAL_DESIGNATOR_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: formal_designator ::= generic_name | port_name | parameter_name
-- Case Type: Positive
-- Test Focus: Production-specific: exercises formal_designator with all three alternatives (generic_name, port_name, parameter_name) in a mixed generic/port component instantiation.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity formal_designator_syn_s2 is
  port (
    clk    : in  bit;
    data   : in  bit_vector(7 downto 0);
    result : out bit_vector(7 downto 0)
  );
end entity formal_designator_syn_s2;

architecture rtl of formal_designator_syn_s2 is
  component pipeline_stage is
    generic (
      WIDTH     : integer := 8;
      PIPELINE  : boolean := true
    );
    port (
      clock   : in  bit;
      d_in    : in  bit_vector(WIDTH-1 downto 0);
      d_out   : out bit_vector(WIDTH-1 downto 0)
    );
  end component;
begin
  u_pipe : pipeline_stage
    generic map (
      WIDTH    => 8,
      PIPELINE => true
    )
    port map (
      clock => clk,
      d_in  => data,
      d_out => result
    );
end architecture rtl;
