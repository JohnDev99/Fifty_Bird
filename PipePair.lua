PipePair = Class {}

local GAP_HEIGHT = 90

function PipePair:init(y)
    --Posiçao inicial fora da tela
    self.x = VIRTUAL_WIDTH + math.random(32, 10)
    self.y = y
    --Posicionar obstaculos sempre em pares
    self.pipes = {
        ['upper'] = Pipe('top', self.y),
        ['lower'] = Pipe('bottom', self.y + PIPE_HEIGHT + math.random(90, 200))
    }
    --booleano para vereficar se esse pare pode sair da lista
    self.remove = false
end

function PipePair:update(dt)
    if self.x > -PIPE_WIDTH then
        self.x = self.x - PIPE_SPEED * dt
        self.pipes['lower'].x = self.x
        self.pipes['upper'].x = self.x
    else
        self.remove = true
    end
end

function PipePair:render()
    for k, pipe in pairs(self.pipes) do
        pipe:render()
    end
end
