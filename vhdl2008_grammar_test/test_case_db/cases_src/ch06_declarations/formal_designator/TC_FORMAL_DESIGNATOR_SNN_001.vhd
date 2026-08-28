-- =============================================================
-- Case ID: TC_FORMAL_DESIGNATOR_SNN_001
-- Rule Type: Syntax (Negative)
-- BNF Production: FORMAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: formal_designator ::= generic_name | port_name | parameter_name
-- Test Focus: SNN — missing formal_designator: the arrow "=>" is present
--   but no identifier precedes it. In a port map association, the formal
--   designator must be a valid generic_name, port_name, or parameter_name.
--   An empty left-hand side violates the BNF.
-- Case Type: Negative
-- Expected Result: Triggers syntax error (missing formal_designator before =>)
-- Dependencies: None
-- =============================================================

entity mux2to1 is
  port (
    d0 : in  bit;
    d1 : in  bit;
    sel : in  bit;
    y  : out bit
  );
end entity mux2to1;

architecture rtl of mux2to1 is
begin
  y <= d0 when sel = '0' else d1;
end architecture rtl;

entity formal_desig_snn1 is
  port (
    din_a  : in  bit;
    din_b  : in  bit;
    sel_in : in  bit;
    mux_out : out bit
  );
end entity formal_desig_snn1;

architecture struct of formal_desig_snn1 is
  component mux2to1 is
    port (
      d0  : in  bit;
      d1  : in  bit;
      sel : in  bit;
      y   : out bit
    );
  end component mux2to1;
begin
  -- ERROR: missing formal_designator before "=>", the left-hand side
  -- of the association is empty. A valid port_name like "d0" is required.
  u_mux : mux2to1
    port map (
      => din_a,   -- ERROR: no formal_designator before =>
      d1 => din_b,
      sel => sel_in,
      y  => mux_out
    );
end architecture struct;
