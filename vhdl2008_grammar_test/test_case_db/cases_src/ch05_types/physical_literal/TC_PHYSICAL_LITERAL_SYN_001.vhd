-- =============================================================
-- Case ID: TC_PHYSICAL_LITERAL_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PHYSICAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_literal ::= [ abstract_literal ] unit_name
-- Case Type: Positive
-- Test Focus: Bare unit name as physical literal (no abstract_literal prefix) — time unit 'ns' used directly as a physical literal without numeric prefix
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity phys_lit_bare_unit is
  port(
    clk      : in  bit;
    duration : out time
  );
end entity;

architecture timing_ref of phys_lit_bare_unit is
  signal pulse_width : time := ns;
  signal counter     : natural := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      counter <= counter + 1;
      if counter mod 5 = 0 then
        pulse_width <= ns;  -- bare unit as physical literal
      end if;
    end if;
  end process;
  duration <= pulse_width;
end architecture;
