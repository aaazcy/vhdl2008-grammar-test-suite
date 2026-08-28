-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_RESOLUTION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_resolution ::= resolution_indication
-- Case Type: Positive (Production-Specific)
-- Test Focus: Direct array_element_resolution test: resolution
--            function name used as the resolution_indication in
--            an array element subtype declaration. Models a
--            wired-OR backplane signal array.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity backplane_signal_array is
  port (
    card0_sig : in  bit_vector(7 downto 0);
    card1_sig : in  bit_vector(7 downto 0);
    bp_out    : out bit_vector(7 downto 0)
  );
end entity backplane_signal_array;

architecture rtl of backplane_signal_array is
  function wired_or (sigs : bit_vector) return bit is
    variable v : bit := '0';
  begin
    for i in sigs'range loop
      v := v or sigs(i);
    end loop;
    return v;
  end function;
  -- array_element_resolution: the resolution_indication is "wired_or"
  subtype bp_bit is wired_or bit;
  type backplane is array (7 downto 0) of bp_bit;
  signal bp : backplane;
begin
  bp <= backplane(card0_sig);
  bp <= backplane(card1_sig);
  bp_out <= bit_vector(bp);
end architecture rtl;
