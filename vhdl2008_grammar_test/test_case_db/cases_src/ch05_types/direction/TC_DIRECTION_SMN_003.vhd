-- =============================================================
-- Case ID: TC_DIRECTION_SMN_003
-- Rule Type: Static Model
-- Related Rule ID: BNF_DIRECTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: direction ::= to | downto
-- Case Type: Negative
-- Test Focus: Static model negative — the for-loop range '7.0 downto 0.0' applies direction 'downto' to real bounds, but a loop parameter range must be discrete; real bounds cannot form a discrete range regardless of the direction
-- Expected Result: Triggers semantic error: range is not discrete
-- Dependencies: None
-- =============================================================
entity dir_mismatch_ent is
  port ( dout : out integer );
end entity dir_mismatch_ent;
architecture rtl of dir_mismatch_ent is
  type t_vec is array (7 downto 0) of integer;
  signal s_vec : t_vec := (others => 0);
  signal s_sum : integer := 0;
begin
  process
  begin
    for i in 7.0 downto 0.0 loop
      s_sum <= s_sum + s_vec(i);
    end loop;
    dout <= s_sum;
    wait;
  end process;
end architecture rtl;
