-- =============================================================
-- Case ID: TC_FORMAL_DESIGNATOR_SNN_004
-- Rule Type: Syntax (Negative)
-- BNF Production: FORMAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: formal_designator ::= generic_name | port_name | parameter_name
-- Test Focus: SNN — formal_designator is a keyword instead of an identifier.
--   The BNF requires an identifier (generic_name, port_name, parameter_name).
--   Using the reserved word "signal" as a formal_designator triggers a syntax
--   error because it is not a valid identifier in this context.
-- Case Type: Negative
-- Expected Result: Triggers syntax error (reserved word used as designator)
-- Dependencies: None
-- =============================================================

entity d_flipflop is
  port (
    d   : in  bit;
    clk : in  bit;
    q   : out bit
  );
end entity d_flipflop;

architecture rtl of d_flipflop is
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      q <= d;
    end if;
  end process;
end architecture rtl;

entity formal_desig_snn4 is
  port (
    data_in   : in  bit;
    clock     : in  bit;
    data_out  : out bit
  );
end entity formal_desig_snn4;

architecture struct of formal_desig_snn4 is
  component d_flipflop is
    port (
      d   : in  bit;
      clk : in  bit;
      q   : out bit
    );
  end component d_flipflop;
begin
  -- ERROR: "signal" is a reserved VHDL keyword, not a valid port_name.
  -- The formal_designator must be an identifier from the component's port list.
  u_ff : d_flipflop
    port map (
      signal => data_in,   -- ERROR: reserved word "signal" as formal_designator
      clk    => clock,
      q      => data_out
    );
end architecture struct;
