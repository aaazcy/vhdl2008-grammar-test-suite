-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_SMN_2
-- Related Rule ID: SEM_PROTECTE_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body ::=
--   protected body
--     protected_type_body_declarative_part
--   end protected body [ protected_type_simple_name ]
-- Test Focus: SEMANTIC — protected body method signature does not
--   match the declaration. The body has `procedure set(x:integer)`
--   but the declaration says `procedure set(v:real)`.
--   The parameter subtype must match exactly.
-- Case Type: Negative
-- Expected Result: Triggers semantic error — mismatched signature
-- =============================================================
entity pt_body_sem_sig_mismatch is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_body_sem_sig_mismatch;

architecture rtl of pt_body_sem_sig_mismatch is
  type t_mismatch is protected
    procedure set(v : real);
    impure function get return integer;
  end protected;
  type t_mismatch is protected body
    variable v_stored : integer := 0;
    procedure set(x : integer) is              -- ERROR: parameter type real vs integer
    begin
      v_stored := x;
    end procedure;
    impure function get return integer is
    begin
      return v_stored;
    end function;
  end protected body;
  shared variable sv : t_mismatch;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.set(3.14);
      val <= sv.get;
    end if;
  end process;
end architecture rtl;
