-- =============================================================
-- Case ID: TC_DIRECTION_SYN_007
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: direction ::= to | downto
-- Test Focus: "downto" direction in enumeration subtype. Uses a
--   predefined descending range on an enumerated type to walk
--   states in reverse order. Verifies direction applies beyond
--   integer/array types to enumeration ranges.
-- Expected Result: Compiles; state machine walks reverse sequence
-- Dependencies: None
-- =============================================================
entity reverse_state_walker is
  port (
    clk    : in  bit;
    active : out bit
  );
end entity reverse_state_walker;

architecture downto_enum of reverse_state_walker is
  type t_state is (S0, S1, S2, S3, S4, S5, S6, S7);
  signal current : t_state := S7;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      -- Walk descending: S7 downto S0 via integer position
      for i in t_state'pos(S7) downto t_state'pos(S0) loop
        if i = t_state'pos(current) then
          if current = S0 then
            current <= S7;
          else
            current <= t_state'val(i - 1);
          end if;
        end if;
      end loop;
    end if;
  end process;
  active <= '1' when current = S0 else '0';
end architecture downto_enum;
