-- =============================================================
-- Case ID: TC_DIRECTION_SYN_006
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: direction ::= to | downto
-- Test Focus: "to" direction used in subtype constraint narrowing an
--   integer type. The subtype range uses expression direction expression
--   form with constants. Verifies direction in scalar subtype declaration.
-- Expected Result: Compiles; bounded counter operates within subtype
-- Dependencies: None
-- =============================================================
entity bounded_pulse_counter is
  port (
    clk     : in  bit;
    reset   : in  bit;
    count   : out integer
  );
end entity bounded_pulse_counter;

architecture to_subtype of bounded_pulse_counter is
  type t_wide is range 0 to 65535;
  constant C_LO : t_wide := 100;
  constant C_HI : t_wide := 200;
  subtype t_window is t_wide range C_LO to C_HI;
  signal counter : t_window := 100;
begin
  process(clk, reset)
  begin
    if reset = '1' then
      counter <= 100;
    elsif clk'event and clk = '1' then
      if counter = 200 then
        counter <= 100;
      else
        counter <= counter + 1;
      end if;
    end if;
  end process;
  count <= integer(counter);
end architecture to_subtype;
