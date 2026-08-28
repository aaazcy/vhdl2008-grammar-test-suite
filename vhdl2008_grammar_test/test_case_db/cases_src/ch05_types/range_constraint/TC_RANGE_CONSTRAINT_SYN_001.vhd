-- =============================================================
-- Case ID: TC_RANGE_CONSTRAINT_SYN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range_constraint ::= range range
-- Test Focus: Range constraint using expression range in integer
--   subtype declaration. The "range 0 to 255" constrains the base
--   type to a subrange. Verifies the canonical use of range_constraint
--   with ascending direction.
-- Expected Result: Compiles; subtype values bounded to 0..255
-- Dependencies: None
-- =============================================================
entity range_constraint_ascending is
  port (
    clk   : in  bit;
    count : out integer
  );
end entity range_constraint_ascending;

architecture asc_constraint of range_constraint_ascending is
  type t_big is range 0 to 65535;
  subtype t_small is t_big range 0 to 255;
  signal counter : t_small := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if counter = 255 then
        counter <= 0;
      else
        counter <= counter + 1;
      end if;
    end if;
  end process;
  count <= integer(counter);
end architecture asc_constraint;
