-- =============================================================
-- Case ID: TC_SLICE_NAME_SNN_S01
-- Rule Type: Syntax
-- BNF Production: SLICE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Test Focus: slice_name: wrong range format in slice
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity sn_e is port(r:out integer); end entity;
architecture bh of sn_e is
  signal s:bit_vector(7 downto 0):=X"00";
begin
  r<=1 when s(7 0)="0000" else 0;  -- ERROR: missing direction in slice
end architecture;
