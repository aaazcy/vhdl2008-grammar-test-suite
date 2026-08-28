-- =============================================================
-- Case ID: TC_RANGE_CONSTRAINT_SYN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range_constraint ::= range range
-- Test Focus: Range constraint with descending direction (range 255
--   downto 0) on a subtype. The constraint uses the expression form
--   with "downto" inside range_constraint.
-- Expected Result: Compiles; descending counter operates correctly
-- Dependencies: None
-- =============================================================
entity range_constraint_descending is
  port (
    clk     : in  bit;
    count   : out integer
  );
end entity range_constraint_descending;

architecture desc_constraint of range_constraint_descending is
  type t_big is range 0 to 65535;
  subtype t_down is t_big range 255 downto 0;
  signal counter : t_down := 255;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if counter = 0 then
        counter <= 255;
      else
        counter <= counter - 1;
      end if;
    end if;
  end process;
  count <= integer(counter);
end architecture desc_constraint;
